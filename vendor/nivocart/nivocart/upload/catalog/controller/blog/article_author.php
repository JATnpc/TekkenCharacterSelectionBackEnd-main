<?php
class ControllerBlogArticleAuthor extends Controller {

	public function index() {
		$this->language->load('blog/article');

		$this->document->setTitle(($this->config->get('blog_heading')) ? $this->config->get('blog_heading') : $this->language->get('heading_title'));

		$this->document->addStyle('catalog/view/theme/default/stylesheet/blog-system.css');

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', '', 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('blog/article_list', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->load->model('blog/article');
		$this->load->model('tool/image');

		if (isset($this->request->get['blog_author_id'])) {
			$blog_author_id = $this->request->get['blog_author_id'];
		} else {
			$blog_author_id = 0;
		}

		if ($blog_author_id) {
			$author_info = $this->model_blog_article->getAuthorInformation($blog_author_id);

			$this->data['heading_title'] = $author_info['name'];

			$this->data['breadcrumbs'][] = array(
				'text'      => $author_info['name'],
				'href'      => $this->url->link('blog/article_author', 'blog_author_id=' . $blog_author_id, 'SSL'),
				'separator' => $this->language->get('text_separator')
			);

			$this->data['articles'] = array();

			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
			} else {
				$limit = $this->config->get('config_catalog_limit');
			}

			$data = array(
				'blog_author_id' => $blog_author_id,
				'start'          => ($page - 1) * $limit,
				'limit'          => $limit
			);

			$author_total = $this->model_blog_article->getTotalArticleAuthorWise($blog_author_id);

			$results = $this->model_blog_article->getArticleAuthorWise($data);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], 100, 100);
				} else {
					$image = '';
				}

				if ($result['description']) {
					$description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 300) . '...';
				} else {
					$description = '';
				}

				$total_comments = $this->model_blog_article->getTotalComments($result['blog_article_id']);

				if ($total_comments != 1) {
					$total_comments .= $this->language->get('text_comments');
				} else {
					$total_comments .= $this->language->get('text_comment');
				}

				$this->data['articles'][] = array(
					'blog_article_id' => $result['blog_article_id'],
					'article_title'   => $result['article_title'],
					'author_name'     => $result['author_name'],
					'image'           => $image,
					'date_added'      => date($this->language->get('text_date_format'), strtotime($result['date_modified'])),
					'description'     => $description,
					'href'            => $this->url->link('blog/article_info', 'blog_article_id=' . $result['blog_article_id'], 'SSL'),
					'author_href'     => $this->url->link('blog/article_author', 'blog_author_id=' . $result['blog_author_id'], 'SSL'),
					'comment_href'    => $this->url->link('blog/article_info', 'blog_article_id=' . $result['blog_article_id'], 'SSL'),
					'allow_comment'   => $result['allow_comment'],
					'total_comment'   => $total_comments
				);
			}

			$this->data['author_history'] = $this->config->get('blog_author_history');

			if ($this->data['articles'] && $author_info) {
				$this->data['author_information_found'] = 1;

				$this->data['author_name'] = $author_info['name'];

				if ($author_info['image']) {
					$this->data['author_image'] = $this->model_tool_image->resize($author_info['image'], 80, 80);
				} else {
					$this->data['author_image'] = $this->model_tool_image->resize('no_image.jpg', 80, 80);
				}

				if ($author_info['description']) {
					$this->data['author_description'] = html_entity_decode($author_info['description'], ENT_QUOTES, 'UTF-8');
				} else {
					$this->data['author_description'] = '';
				}
			}

			$this->data['button_continue_reading'] = $this->language->get('button_continue_reading');

			$this->data['text_not_found'] = $this->language->get('text_not_found');

			$url = '';

			if (isset($this->request->get['blog_author_id'])) {
				$url .= '&blog_author_id=' . $this->request->get['blog_author_id'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $author_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('blog/article_author', $url, 'SSL');

			$this->data['pagination'] = $pagination->render();

			// Theme
			$this->data['template'] = $this->config->get('config_template');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/blog/article_author.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/blog/article_author.tpl';
			} else {
				$this->template = 'default/template/blog/article_author.tpl';
			}

			$this->children = array(
				'common/content_higher',
				'common/content_high',
				'common/content_left',
				'common/content_right',
				'common/content_low',
				'common/content_lower',
				'common/footer',
				'common/header'
			);

			$this->response->setOutput($this->render());

		} else {
			$url = '';

			if (isset($this->request->get['blog_author_id'])) {
				$url .= '&blog_author_id=' . $this->request->get['blog_author_id'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$this->data['breadcrumbs'] = array();

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', '', 'SSL'),
				'separator' => false
			);

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('blog/article_list', '', 'SSL'),
				'separator' => $this->language->get('text_separator')
			);

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_author_error'),
				'href'      => $this->url->link('blog/article_author', $url, 'SSL'),
				'separator' => $this->language->get('text_separator')
			);

			$this->document->setTitle($this->language->get('text_author_error'));

			$this->data['heading_title'] = $this->language->get('text_author_error');

			$this->data['text_error'] = $this->language->get('text_author_error');

			$this->data['button_continue'] = $this->language->get('button_continue');

			$this->data['continue'] = $this->url->link('common/home', '', 'SSL');

			// Theme
			$this->data['template'] = $this->config->get('config_template');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}

			$this->children = array(
				'common/content_higher',
				'common/content_high',
				'common/content_left',
				'common/content_right',
				'common/content_low',
				'common/content_lower',
				'common/footer',
				'common/header'
			);

			$this->response->addheader($this->request->server['SERVER_PROTOCOL'] . ' 404 not found');
			$this->response->setOutput($this->render());
		}
	}
}
